<?php

namespace App\Database;

class Platform extends Model
{
   
    public function getTableName(): string 
    {
        return "Platforms";
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