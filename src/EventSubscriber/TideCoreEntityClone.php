<?php

namespace Drupal\tide_core\EventSubscriber;

use Drupal\entity_clone\Event\EntityCloneEvent;
use Drupal\entity_clone\Event\EntityCloneEvents;
use Drupal\user\UserInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

/**
 * Class TideCoreEntityClone.
 *
 * @package Drupal\tide_core
 */
class TideCoreEntityClone implements EventSubscriberInterface {

 public static function getSubscribedEvents() {
   $a = 'b';
   return [
     EntityCloneEvents::POST_CLONE => 'postCloneUpdate'
   ];
 }

 public function postCloneUpdate(EntityCloneEvent $event) {
   $current_user = \Drupal\user\Entity\User::load(\Drupal::currentUser()
     ->id());
   $cloned_entity = $event->getClonedEntity();
   $a = 'b';
   $cloned_entity->setRevisionUser($current_user);
   $user = $cloned_entity->getRevisionUser();
   $cloned_entity->save();
 }

}
