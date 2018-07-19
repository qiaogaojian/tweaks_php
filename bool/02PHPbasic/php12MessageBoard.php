<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./php12.css">
    <title>MessageBoarder</title>
</head>

<body>

    <div id="main">

        <h1>留 言 本</h1>
        <div id="top">
            <form action="./php12Post.php" method="POST">
                <div id="tittle">
                    <input type="text" name="tittle">
                </div>
                <div id="content">
                    <textarea name="content" id="content" cols="30" rows="10"></textarea>
                </div>
                <div id="submitbutton">
                    <input type="submit" value="提  交">
                </div>
            </form>
        </div>

        <div id="down">     
           
            <?php
            $fileMessage = file("msg.txt");
            if (count($fileMessage) > 0) {
                foreach ($fileMessage as $message) {
                    $messageText = json_decode($message);
                    echo "<div class='board'> PostTime: " . $messageText->time . "<br>";
                    echo "Tittle: " . $messageText->tittle . "<br>";
                    echo "Content:<br>" . $messageText->content . "<br></div>";
                }
            }

            ?>
    </div>

</body>

<link rel="stylesheet" href="../01Html/reset.css">

</html>