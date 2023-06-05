<?php

namespace App\Database\Dataset;



class ModelType extends BaseDataset
{
    public function getName(): string
    {
        $json = $this->jsonSerialize();
        $keyName = array_values(array_filter(
            array_keys($json),
            function ($key) {
                return $key !== "id";
            }
        ))[0];
        return $json[$keyName];
    }
}