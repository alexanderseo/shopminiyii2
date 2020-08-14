<?php
namespace common\fixtures;

use Faker\Factory;
use yii\test\ActiveFixture;

class ProductFixture extends ActiveFixture
{
    public $modelClass = 'common\models\Product';

    public function getData()
    {
        $faker = Factory::create('ru_RU');
        $data = [];
        foreach (range(0,50) as $i) {
            $data[] = [
                'title' => $faker->sentence(3),
                'text' => $faker->text(400),
                'price' => $faker->randomNumber(4),
            ];
        }
        return $data;
    }
}