<?php

use yii\db\Schema;
use yii\db\Migration;

class m151116_130400_new_files_table extends Migration
{

    public function up()
    {

        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%files}}',[
            'id' => $this->primaryKey(),
            'name' => Schema::TYPE_STRING,
            'link' => Schema::TYPE_STRING,
            'created_at' =>Schema::TYPE_DATETIME,
            'updated_at'=> Schema::TYPE_DATETIME,
            'is_header' => $this->smallInteger(),
            'status' => $this->smallInteger(),
        ],$tableOptions);
    }

    public function down()
    {
        echo "m151116_130400_new_files_table cannot be reverted.\n";
        $this->dropTable('{{%files}}');
        return false;
    }


    public function safeUp()
    {
    }

    public function safeDown()
    {
    }

}
