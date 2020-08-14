<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%order_products}}`.
 */
class m200814_021609_create_order_products_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%order_products}}', [
            'id' => $this->primaryKey(),
            'order_id' => $this->integer()->notNull(),
            'product_id' => $this->integer()->notNull(),
        ]);

        $this->addForeignKey(
            'fk-order_products-order',
            'order_products',
            'order_id',
            'orders',
            'id',
            'CASCADE'
        );

        $this->addForeignKey(
            'fk-order_products-product',
            'order_products',
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
        $this->dropForeignKey('fk-order_products-order', 'order_products');
        $this->dropForeignKey('fk-order_products-product', 'order_products');
        $this->dropTable('{{%order_products}}');
    }
}
