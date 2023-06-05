<?php

namespace App\Database;

class DeveloperStudio extends Model
{
   
    public function getTableName(): string 
    {
        return "DeveloperStudio";
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