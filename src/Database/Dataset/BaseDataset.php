<?php

namespace App\Database\Dataset;

use \JsonSerializable;
use \ReflectionClass;
use \ReflectionProperty;
use \ArrayAccess;
use \Iterator;
use ReturnTypeWillChange;
use Stringable;

class BaseDataset implements JsonSerializable, ArrayAccess, Iterator, Stringable
{
    private int $__index;
    private array $__itemKeys;
    private array $__itemValues;

    public function rewind(): void
    {
        $this->__index = 0;
        $items = array_filter(
            get_object_vars($this),
            function ($value, $key) {
                return !str_starts_with($key, "__");
            },
            ARRAY_FILTER_USE_BOTH
        );

        // array_map(range(0, 25), fn($v) => chr(97 + $v))
        $this->__itemKeys = array_keys($items);
        $this->__itemValues = array_values($items);
    }

    public function valid(): bool 
    {
        return isset($this->__itemKeys[$this->__index]);
    }

    public function key(): mixed
    {
        return $this->__itemKeys[$this->__index];
    }

    public function current(): mixed
    {
        return $this->__itemValues[$this->__index];
    }

    public function next(): void
    {
        $this->__index++;
    }
    
    public function offsetSet($offset, $value): void
    {
        if ($this->offsetExists($offset)) {
            $this->$offset = $value;
        }
    }

    public function offsetExists($offset): bool
    {
        return isset($this->$offset) && str_starts_with("__", $offset);
    }

    public function offsetUnset($offset): void
    {
        if ($this->offsetExists($offset)) {
            unset($this->$offset);
        }
    }

    #[ReturnTypeWillChange]
    public function offsetGet($offset)
    {
        if ($this->offsetExists($offset)) {
            return $this->$offset;
        }
        return null;
    }

    public function jsonSerialize()
    {
        return array_filter(
            get_object_vars($this),
            function ($key, $value) {
                return !str_starts_with($key, "__");
            },
            ARRAY_FILTER_USE_BOTH
        );
    }

    public function __toString(): string
    {
        $propretys = "";
        foreach ($this AS $key => $value) {
            $propretys .= "{$key} = {$value}".PHP_EOL;
        }
        $fullClassString = "<".__CLASS__;
        $fullClassString .= $propretys;
        $fullClassString .= ">";
        return $fullClassString;
    }
}