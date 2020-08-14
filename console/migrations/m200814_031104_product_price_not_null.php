<?php

use yii\db\Migration;

/**
 * Class m200814_031104_product_price_not_null
 */
class m200814_031104_product_price_not_null extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->alterColumn('{{%products}}', 'price', $this->float()->notNull());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->alterColumn('{{%products}}', 'price', $this->float());
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200814_031104_product_price_not_null cannot be reverted.\n";

        return false;
    }
    */
}
