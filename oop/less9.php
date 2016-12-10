	<?
	class Workers
	{
		protected $salary;
		protected $expreince;

		public function __construct($salary, $expreince)
		{
			$this->salary = $salary;
			$this->expreince = $expreince;

		}

		public function getInfo()
		{
			echo $this->salary.'<br>';
			echo $this->expreince.'<br>';
			if ($this->department) {
				echo $this->department;
			}
			
		}
}


	class Managers extends Workers
	{
		public $department;

		public function __construct($department){
			$this->department = $department;
		}

	}


	$john = new Workers(3500,1.5);
	$john->getInfo();

	$jack = new Managers("mobile");
	$jack->getInfo();


		?>