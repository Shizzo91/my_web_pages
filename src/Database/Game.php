<?php

    namespace App\Database;

    use PDO;

    class Game extends Model
    {
        private const RELATIONSHIP_TABLE_GENRE = "GamesGenre";
        private const RELATIONSHIP_FOREIGN_KEY_GENRE = "gameID";
        private const RELATIONSHIP_TABLE_PLATFORM = "GamesPlatform";
        private const RELATIONSHIP_FOREIGN_KEY_PLATFORM = "gameID";
        public function getTableName(): string
        {
            return "Games";
        }

        public function getTableDataset(): string
        {
            return "App\\Database\\Dataset\\ModelType";
        }

        public function getColumnName(): string
        {
            return "title";
        }

        private function getModel(string $type): Model {
            return Entity::get()->make($type);
        }

        public function getAllGenresOf(int $gameId): array
        {
            $sth = $this->pdo->prepare(
                "SELECT * FROM `".self::RELATIONSHIP_TABLE_GENRE."`  WHERE `".self::RELATIONSHIP_FOREIGN_KEY_GENRE."` = ?;"
            );
            $sth->execute([$gameId]);

            $genreModel = $this->getModel("genre");
            return array_map(
                fn($row) => $genreModel->get(array_values($row)[1]),
                $sth->fetchAll(PDO::FETCH_ASSOC) ?: []
            );
        }

        public function getAllPlatformsOf(int $gameId): array
        {
            $sth = $this->pdo->prepare(
                "SELECT * FROM `".self::RELATIONSHIP_TABLE_PLATFORM."`  WHERE `".self::RELATIONSHIP_FOREIGN_KEY_PLATFORM."` = ?;"
            );
            $sth->execute([$gameId]);
            $platformModel = $this->getModel("platform");
            return array_map(
                function ($row) use ($platformModel) {
                    $platform = $platformModel->get(array_values($row)[1]);
                    $platform->systemRequirements = array_values($row)[2];
                    return $platform;
                },
                $sth->fetchAll(PDO::FETCH_ASSOC) ?: []
            );
        }

    }