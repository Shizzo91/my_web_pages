<?php

namespace App\Utils;


class SideBar {
    private static function letterPaars(int $parts)
    {
        $paars = [];
        $step = (int) floor(26 / $parts);
        for ($i=0; $i < $parts; $i++) {
            $paar = [$i * $step];
            if ($parts - 1 === $i) {
                $paar[] = 25;
            } else {
                $paar[] = $i * $step + $step -1;
            }
            $paars[] = array_map(
                function ($charInt) {
                    return chr(65 + $charInt);
                },
                $paar
            );
        }
        return $paars;
    }

    private Entity $entity;

    public function __construct(private int $letterPaars = 5) {
    }


    public function getArray(): array
    {
        return [
            "games" => self::letterPaars($this->letterPaars),
            "genres" => self::letterPaars($this->letterPaars),
            "platforms" => self::letterPaars($this->letterPaars),
            "Developer-Studios" => self::letterPaars($this->letterPaars),
            // "platforms" => letterPaars($this->letterPaars),
        ];
    }
}