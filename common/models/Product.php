<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "{{%products}}".
 *
 * @property int $id
 * @property string $title
 * @property string|null $text
 * @property float|null $price
 *
 */
class Product extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return '{{%products}}';
    }

    public function rules()
    {
        return [
            [['title'], 'required'],
            [['title'], 'string', 'max' => 255],
            [['text'], 'string'],
            [['price'], 'required'],
            [['price'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Название',
            'text' => 'Описание',
            'price' => 'Цена',
        ];
    }
}
