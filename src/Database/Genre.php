<?php

namespace App\Database;

class Genre extends Model
{
   
    public function getTableName(): string 
    {
        return "Genres";
    }

    public function getTableDataset(): string
    {
        return "App\\Database\\Dataset\\ModelType";
    }
    public function getColumnName(): string
    {
        return "genre";
    }

}