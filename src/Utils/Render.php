<?php

namespace App\Utils;

use \Twig\Loader\FilesystemLoader;
use \Twig\Environment;

$baseName = dirname(__FILE__);

class Render
{
    const BASE_NAME = Config::URL_PREFIX;
    const TEMPLATE_DIR = self::BASE_NAME."templates/";
    const STATIC_DIR = self::BASE_NAME."/static/";
    // const STATIC_DIR = "/static/";
    const IMAGE_DIR = self::STATIC_DIR."img/";
    const JS_DIR = self::STATIC_DIR."js";
    const CSS_DIR = self::STATIC_DIR."css";
    const CACHE_DIR = self::STATIC_DIR."cache/";

    /**
     * @param string $buffer
     * @return string
     */
    public static function HTML_MINIFY(string $buffer): string
    {

        $search = [
            '/\>[^\S ]+/s',     // strip whitespaces after tags, except space
            '/[^\S ]+\</s',     // strip whitespaces before tags, except space
            '/(\s)+/s',         // shorten multiple whitespace sequences
            '/<!--(.|\s)*?-->/', // Remove HTML comments
        ];

        $replace = [
            '>',
            '<',
            '\\1',
            '',
        ];

        return preg_replace(
            $search,
            $replace,
            $buffer
        );
    }
    private static function getEnvironment(FilesystemLoader $loader): Environment
    {
        $twig = new Environment($loader, [
            // 'cache' => self::CACHE_DIR,
        ]);
        $twig->addGlobal('__URL_PREFIX__', Config::URL_PREFIX);
        $twig->addGlobal('__JS__', self::JS_DIR);
        $twig->addGlobal('__CSS__', self::CSS_DIR);
        $twig->addGlobal('__IMAGE__', self::IMAGE_DIR);
        return $twig;
    }

    public static function render(string $tmplPath, array $kwags = []): string
    {
        if (!str_ends_with($tmplPath, ".twig")) {
            $tmplPath .= ".twig";
        }

        $fullPath = self::TEMPLATE_DIR."/".$tmplPath;
        
        if (!file_exists($fullPath)) {
            throw new \Exception("template not found \"{$tmplPath}\"", 1);
        }

        $loader = new FilesystemLoader(self::TEMPLATE_DIR);
        $twig = self::getEnvironment($loader);


        return self::HTML_MINIFY($twig->render($tmplPath, $kwags));
    }


    public static function renderResponse(
        string $tmplPath, 
        array $kwags = []
        ): Response
    {
        return new Response(
            self::render($tmplPath, $kwags),
            200,
            []
        );
    }
}
