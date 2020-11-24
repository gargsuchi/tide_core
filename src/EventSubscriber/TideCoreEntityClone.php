<?php

namespace Drupal\tide_core\EventSubscriber;

use Drupal\entity_clone\Event\EntityCloneEvent;
use Drupal\user\Entity\User;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Class TideCoreEntityClone.
 *
 * @package Drupal\tide_core
 */
class TideCoreEntityClone implements EventSubscriberInterface {

  /**
   * {@inheritDoc}
   */
  public static function getSubscribedEvents() {
    return [
      'entity_clone.post_clone' => 'postCloneUpdate',
    ];
  }

  /**
   * Alter the owner of a cloned entity to the user who triggered the clone.
   */
  public function postCloneUpdate(EntityCloneEvent $event) {
    $current_user = User::load(\Drupal::currentUser()
      ->id());
    $cloned_entity = $event->getClonedEntity();
    $cloned_entity->setOwner($current_user);
    $cloned_entity->save();
  }

}
