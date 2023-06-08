<?php
    require './vendor/autoload.php';

    use App\Utils\Render;
    use App\Utils\SideBar;
    use App\Database\Entity;
    use App\Database\Model;
    use \App\Utils\Response;
    use \Bramus\Router\Router;

    $entity = Entity::get();

    $genre = $entity->make("genre");
    $sideBar = (new SideBar(5))->getArray();

    function errorResponse(): void
    {
        $response = Render::renderResponse("error/index", [
            "title" => "Page not Found",
        ]);
        $response->setStatusCode(404);
        echo $response;
    }

    function getModel(?string $type): Model
    {
        $entity = Entity::get();
        if ($type === "genres") {
            return $entity->make("genre");
        } elseif ($type === "games") {
             return $entity->make("game");
        } elseif ($type === "platforms") {
            return $entity->make("platform");
        } elseif ($type === "developer-studios") {
            return $entity->make("developerStudio");
        } elseif ($type === "contact-information") {
            return $entity->make("contactInformation");
        } else {
            throw new TypeError("cant identify");
        }
            
    }

     // create composer instances
    $router = new Router();

    $router->get('/add', function() use ($sideBar, $entity) {
        $game = $entity->make("game");
        $genre = $entity->make("genre");
        $platform = $entity->make("platform");
        $developerStudio = $entity->make("developerStudio");
        echo Render::render("add/game", [
            "title" => "Adding Game",
            "sidebar" => $sideBar,
            "platforms" => $platform->all(),
            "developStudios" => $developerStudio->all(),
            "genres" => $genre->all(),
        ]);
    });

    $router->post('/add', function() use ($sideBar, $entity) {

        $from = [
            "gameTitle" => $_POST["gameTitle"] ?? null,
            "developStudio" => $_POST["developStudio"] ?? null,
            "gameDescription" => $_POST["gameDescription"] ?? null,
            "screenshot" => $_POST["screenshot"] ?? null,
            "trailer" => $_POST["trailer"] ?? null,
            "genres" => $_POST["genres"] ?? null,
            "platfroms" => array_filter(
                $_POST["platfroms"] ?? [],
                function($value) {
                    return !empty($value["id"]);
                }
            ),
        ];
        // $gameTitle = $_POST["gameTitle"] ?? null;
        // $developStudio = $_POST["developStudio"] ?? null;
        // $gameDescription = $_POST["gameDescription"] ?? null;
        // $screenshot = $_POST["screenshot"] ?? null;
        // $trailer = $_POST["trailer"] ?? null;
        // $genres = $_POST["genres"] ?? null;
        // $platfroms = array_filter(
        //     $_POST["platfroms"] ?? [],
        //     function($value) {
        //         return !empty($value["id"]);
        //     }
        // );




        // echo Render::render("test/index");
        // $game = $entity->make("game");
        // $genre = $entity->make("genre");
        // $platform = $entity->make("platform");
        // $developerStudio = $entity->make("developerStudio");
        echo Render::render("add/gameAdded", [
            "title" => "Adding Game",
            "sidebar" => $sideBar,
            "content" => json_encode($from, JSON_PRETTY_PRINT),
            // "platforms" => $platform->all(),
            // "developStudios" => $developerStudio->all(),
            // "genres" => $genre->all(),
        ]);
    });

    $router->get('/', function() use($sideBar) {
        echo Render::render("main", [
            "title" => "Main Page",
            "sidebar" => $sideBar,
        ]);
    });

    $router->get('/impressum', function() use($sideBar) {
        echo Render::render("impressum", [
            "title" => "Impressum",
            "sidebar" => $sideBar,
        ]);
    });

    $router->mount(
        '/(games|genres|platforms|developer-studios)', 
        function() use($sideBar, $router) {
            // list view
            $router->get(
                '/([A-Z])/([A-Z])', 
                function ($type, $from, $to) use($sideBar) {
                    $model = getModel($type);
                    echo Render::render("model/list", [
                        "title" => "List Page",
                        "sidebar" => $sideBar,
                        "test" => print_r($model->fromTo($from, $to), true),
                        "models" => $model->fromTo($from, $to),
                        "type" => $type,
                    ]);
                }
            );
            // detail view
            $router->get(
                '/([0-9]+)', 
                function ($type, $id) use($sideBar) {
                    $model = getModel($type);
                    if (is_a($model, "App\\Database\\Game")) {
                        $game = $model->get($id);
                        $developerStudio = getModel("developer-studios")->get($game->developerStudioID);
                        echo Render::render("model/detail-game", [
                            "title" => "Detail view Page",
                            "csses" => [
                                "game-css" => "game.css"
                            ],
                            "sidebar" => $sideBar,
                            "game" => $game,
                            "genres" => $model->getAllGenresOf($game->id),
                            "platforms" => $model->getAllPlatformsOf($game->id),
                            "developerStudio" => $developerStudio,
                            "contactInformation" => getModel("contact-information")->get($developerStudio->contactInformationID),
                        ]);
                    } elseif (is_a($model, "App\\Database\\DeveloperStudio")) {
                        echo Render::render("model/detail", [
                            "title" => "Detail view Page",
                            "sidebar" => $sideBar,
                            "model" => $model->get($id),
                        ]);
                    } else {
                        echo Render::render("model/detail", [
                            "title" => "Detail view Page",
                            "sidebar" => $sideBar,
                            "model" => $model->get($id),
                        ]);
                    }
                }
            );
        }
    );

    $router->all(".*", "errorResponse");
    $router->set404("/(.*)?", "errorResponse");

    // führt das routing nach registrierung der seiten aus
    $router->run();
?>