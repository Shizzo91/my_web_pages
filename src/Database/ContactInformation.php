<?php

    namespace App\Database;

    class ContactInformation extends Model
    {

        public function getTableName(): string
        {
            return "ContactInformation";
        }

        public function getTableDataset(): string
        {
            return "App\\Database\\Dataset\\ModelType";
        }

        public function getColumnName(): string
        {
            return "name";
        }
    }