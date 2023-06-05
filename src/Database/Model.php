<?php

namespace App\Database;

use App\Database\Dataset\ModelType;

use \PDO;

abstract class Model
{
    protected PDO $pdo;

    public function __construct(PDO $pdo) {
        $this->pdo = $pdo;
    }

    abstract public function getTableName(): string;

    abstract public function getTableDataset(): string;

    abstract public function getColumnName(): string;


    public function all(): array
    {
        $sth = $this->pdo->prepare(
            "SELECT * FROM `".$this->getTableName()."`;"
        );
        $sth->execute();

        return $sth->fetchAll(PDO::FETCH_CLASS, $this->getTableDataset()) ?: [];
    }

    public function fromTo(string $from, string $to): array
    {
        $sth = $this->pdo->prepare(
            "SELECT * FROM `".$this->getTableName()."` WHERE UPPER(LEFT(`".$this->getColumnName()."`,1)) BETWEEN ? AND ?;"
        );
        $sth->execute([$from, $to]);

        return $sth->fetchAll(PDO::FETCH_CLASS, $this->getTableDataset()) ?: [];
    }
    
    public function get(int $id): ?ModelType
    {
        $sth = $this->pdo->prepare(
            "SELECT * FROM `".$this->getTableName()."` WHERE `id` = ?;"
        );
        $sth->execute([$id]);
        $sth->setFetchMode(PDO::FETCH_CLASS, $this->getTableDataset());
        
//             <<<SQL
//             SELECT g.* FROM `Genres` g
// INNER JOIN `GenreGames` gg ON gg.genreID = g.id;
//             SQL;
        return $sth->fetch() ?: null;
    }

    public function add(...$args): int
    {
        $sql = <<<SQL
        SELECT `COLUMN_NAME` FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'Games' 
            AND `TABLE_NAME` = '{$this->getTableName()}' 
            AND `COLUMN_NAME` != "id"; 
        SQL;
        $sth = $this->pdo->prepare($sql);
        $sth->execute();

        $keys = array_map(function ($keyArray) {
            return array_values($keyArray)[0];
        }, $sth->fetchAll());


        if (count($keys) != count($args)) throw new Exception("not the same args");

        $keyPlaceholder = implode(",", $keys);
        $placeholder = implode(",", array_fill(0, count($args), '?'));

        $sql = <<<SQL
        INSERT INTO `{$this->getTableName()}` ({$keyPlaceholder}) VALUES ({$placeholder})
        SQL;

        $sth = $this->pdo->prepare($sql);
        $sth->execute($args);

        return $this->pdo->lastInsertId();
    }
}