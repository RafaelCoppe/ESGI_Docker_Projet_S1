<?php

namespace App\DataFixtures;

use App\Entity\Task;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class TaskFixtures extends Fixture
{
    CONST tasks = [
        ["label" => "Faire les courses", "done" => false],
        ["label" => "Appeler le médecin", "done" => true],
        ["label" => "Répondre aux emails", "done" => false],
        ["label" => "Aller à la gym", "done" => false],
        ["label" => "Lire un chapitre du livre", "done" => true],
        ["label" => "Préparer le rapport", "done" => false],
        ["label" => "Nettoyer la cuisine", "done" => true],
        ["label" => "Réviser pour l'examen", "done" => false],
        ["label" => "Apprendre une nouvelle recette", "done" => false],
        ["label" => "Sortir le chien", "done" => true]
    ];
    public function load(ObjectManager $manager)
    {
        foreach (self::tasks as $unetask) {
            $task = new Task();
            $task->setLabel($unetask['label']);
            $task->setDone($unetask['done']);
            $manager->persist($task);
        }

        $manager->flush();
    }
}