<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%order_items}}`.
 */
class m200814_040423_create_order_items_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%order_items}}', [
            'id' => $this->primaryKey(),
            'order_id' => $this->integer()->notNull(),
            'product_id' => $this->integer()->notNull(),
            'quantity' => $this->integer()->notNull(),
        ]);

        $this->addForeignKey(
            'fk-order_items-order',
            'order_items',
            'order_id',
            'orders',
            'id',
            'CASCADE'
        );

        $this->addForeignKey(
            'fk-order_items-product',
            'order_items',
            'product_id',
            'products',
            'id',
            'NO ACTION'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('fk-order_items-order', 'order_products');
        $this->dropForeignKey('fk-order_items-product', 'order_products');
        $this->dropTable('{{%order_items}}');
    }
}
