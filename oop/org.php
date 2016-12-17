<?
//добавить штрафы
//добавить месяца пусть тикают по нумерам начиная со старта даты
//
//в увольнения сделать unset
class Workers
	{
		protected $name;
		protected $salary;
		protected $position;
		// protected $expreince;

		public function __construct($name, $salary, $position)
		{
			$this->name = $name;
			$this->salary = $salary;
			$this->position = $position;

		}

		public function getInfo()
		{
			echo '<b>Имя:</b> '.$this->name.'<br>';
			echo '<b>З/П:</b> '.$this->salary.'<br>';
			echo '<b>Опыт:</b> '.$this->position.'<br>';
			if ($this->department)
			{
				echo '<b>Руководит отделом: </b> '.$this->department;
			}
			echo '<hr>';
		}

		public function working()
		{
			echo $this->name.' работает.<br>';
		}

		public function getSalary()
		{
			echo $this->name.' получает ЗП '.$this->salary.'.<br>';
		}
	}



class Managers extends Workers
	{
		protected $department;
		public function __construct($name, $salary, $position, $department)
		{
			parent::__construct($name, $salary, $position);
			$this->department = $department;
		}
		//нанимать
		
		public function recruit($name)
		{
			echo $this->position.' '.$this->name.', нанял на работу '.$name->position.' '.$name->name.'<br>';
		}
		//уволнять
		public function fire($name)
		{
			echo $this->position.' '.$this->name.', уволил с работы '.$name->position.' '.$name->name.'<br>';
		}

	}

class Directors extends Managers
	{
		public function __construct($name, $salary, $position, $department)
		{
			parent::__construct($name, $salary, $position, $department);
		}
		//повышать в должности
		public function upPosition($name, $newPosition)
		{
			echo $this->position.' '.$this->name.', повысил в должности '.$name->name.', с '.$name->position;
			$name->position = $newPosition;
			echo ' до '.$name->position.'<br>';
		}

		//понижать в должности
		public function downPosition($name, $newPosition)
		{
			echo $this->position.' '.$this->name.', понизил в должности '.$name->name.', с '.$name->position;
			$name->position = $newPosition;
			echo ' до '.$name->position.'<br>';
			//можно ли тут сменить класс?
		}
		
	}

// $vova->getInfo();
// $dima->getInfo();

$boss = new Directors('Дональд','15000','СЕО','все отделы');
$dima = new Managers('Дима','1500','Менеджер','отдел тех-поддержки');
$vova = new Workers('Вова','500','Программист');

$boss->recruit($dima);
// $boss->Managers::recruit($dima);
$dima->working();
$dima->recruit($vova);
$vova->working();
$vova->getSalary();
$boss->fire($dima);
$dima->fire($boss);














//http://www.triconsole.com/php/oop.php
//https://www.ibm.com/developerworks/library/os-php-7oohabits/
//http://ruseller.com/lessons.php?id=1145
?>