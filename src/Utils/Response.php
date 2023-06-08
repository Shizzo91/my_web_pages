<?php

namespace App\Utils;


use Exception;
use Stringable;

class Response implements Stringable
{
    /**
     * @param string $content
     * @param int $statusCode
     * @param array $headers
     * @throws Exception
     */
    public function __construct(
        private string $content = "",
        private int $statusCode = 200,
        private array $headers = [],
    ) {
        if (array_is_list($this->headers) && !empty($this->headers)) {
            throw new Exception("headers has to be a Associative Arrays", 1);
        }
    }

    /**
     * @param int $statusCode
     * @return void
     */
    public function setStatusCode(int $statusCode): void
    {
       $this->statusCode = $statusCode;
    }

    /**
     * @param string $key
     * @param string $value
     * @return void
     */
    public function addHeader(string $key, string | array $value): void
    {
       $this->headers[$key] = $value;
    }

    /**
     * @param array $headers
     * @return void
     * @throws Exception
     */
    public function addHeaders(array $headers): void
    {
        if (array_is_list($headers) && !empty($headers)) {
            throw new Exception("headers has to be a Associative Arrays", 1);
        } elseif (empty($headers)) {
            throw new Exception("headers is empty", 1);
        }

        $this->headers = array_merge($this->headers, $headers);
    }

    /**
     * @return string
     */
    public function getMinifiedContent(): string
    {
        return Render::HTML_MINIFY($this->content);
    }

    /**
     * @inheritDoc
     * @return string
     */
    public function __toString(): string
    {
        foreach ($this->headers as $key => $value) {
            if (is_array($value)) {
                $value = implode(", ", $value);
            }
            header("{$key}: {$value}");
        }

        http_response_code($this->statusCode);
        return  $this->getMinifiedContent();
    }
}
