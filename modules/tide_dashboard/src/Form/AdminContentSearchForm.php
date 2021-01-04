<?php

namespace Drupal\tide_dashboard\Form;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Provides a simplified search form for Admin content route.
 *
 * @package Drupal\tide_dashboard\Form
 */
class AdminContentSearchForm extends FormBase {

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * AdminContentSearchForm constructor.
   *
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   *   The entity type manager.
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager) {
    $this->entityTypeManager = $entity_type_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'admin_content_search_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    // Set up the form to submit using GET to the correct search page.
    $form['search'] = [
      '#type' => 'fieldset',
      '#open' => TRUE,
      '#collapsible' => FALSE,
      '#title' => $this->t('Search content'),
      '#tree' => FALSE,
      '#attributes' => [
        'class' => ['form--inline'],
      ],
    ];

    $form['search']['title'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Title'),
      '#title_display' => 'invisible',
      '#default_value' => '',
      '#attributes' => [
        'title' => $this->t('Enter the terms you wish to search for.'),
        'placeholder' => $this->t('Enter search term'),
      ],
    ];

    $content_types = [];
    foreach ($this->entityTypeManager->getStorage('node_type')->loadMultiple() as $type) {
      $content_types[$type->id()] = $type->label();
    }
    asort($content_types);
    $content_types = ['All' => $this->t('- Any content type -')] + $content_types;
    $form['search']['type'] = [
      '#type' => 'select',
      '#title' => $this->t('Content type'),
      '#title_display' => 'invisible',
      '#field_prefix' => $this->t('in'),
      '#options' => $content_types,
      '#default_value' => ['All'],
    ];

    $sites = ['All' => $this->t('- Any site -')];
    /** @var \Drupal\taxonomy\TermStorageInterface $term_storage */
    $term_storage = $this->entityTypeManager->getStorage('taxonomy_term');
    $tree = $term_storage->loadTree('sites', 0, NULL, TRUE);
    foreach ($tree as $term) {
      $sites[$term->id()] = $term->depth ? (str_repeat('-', $term->depth) . ' ' . $term->label()) : $term->label();
    }
    $form['search']['field_node_site_target_id'] = [
      '#type' => 'select',
      '#title' => $this->t('Site'),
      '#title_display' => 'invisible',
      '#default_value' => ['All'],
      '#options' => $sites,
    ];

    $form['search']['submit'] = [
      '#type' => 'submit',
      '#value' => $this->t('Search'),
      // Prevent op from showing up in the query string.
      '#name' => '',
      '#attributes' => [
        'class' => ['form-item'],
      ],
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $route = 'system.admin_content';
    $options = [
      'query' => [
        'title' => $form_state->getValue('title'),
        'type' => $form_state->getValue('type'),
        'field_node_site_target_id' => [$form_state->getValue('field_node_site_target_id')],
      ],
    ];
    $form_state->setRedirect($route, [], $options);
  }

}
