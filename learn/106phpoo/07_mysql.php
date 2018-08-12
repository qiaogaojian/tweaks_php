<?php
class Mysql
{
    private $host;
    private $user;
    private $pwd;
    private $dbname;

    private $charset;
    private $conn;

    public function __construct()
    {
        $this->host = "127.0.0.1";
        $this->user = "root";
        $this->pwd = "root";
        $this->dbname = "test";

        $this->Connect($this->host,$this->user,$this->pwd);
        $this->ChangeDB($this->dbname);
        //$this->SetChar($this->charset);
    }

    private function Connect($h, $u, $p)
    {
        $conn = mysqli_connect($h, $u, $p);
        $this->conn = $conn;
    }

    public function ChangeDB($dbname)
    {
        $sql = "use ".$dbname;
        $this->Query($sql);
    }

    public function SetChar($char)
    {
        $sql = "set names ".$char;
        $this->Query($char);
    }

    public function Query($sql)
    {
        return mysqli_query($this->conn,$sql);
    }

    public function GetRow($sql)
    {
        $rs = $this->Query($sql);
        if ($rs)
        {
            return false;
        }
        $row = mysqli_fetch_row($rs);
        return $row[0];
    }

    public function GetAll($sql)
    {
        $list = array();
        $rs = $this->Query($sql);
        if (!$rs)
        {
            return false;
        }
        while($row = mysqli_fetch_assoc($rs))
        {
            $list[] = $row;
        }
        return $list;
    }

    public function Close()
    {
        mysqli_close($this->conn);
    }
}
//TODO insert

$mysqlo = new Mysql();

print_r($mysqlo);

print_r($mysqlo->GetAll("select * from goods"));


