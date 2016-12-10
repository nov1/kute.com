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
		public function __construct($salary, $expreince, $department){
			parent::__construct($salary,$expreince);
			$this->department = $department;
		}

	}


	$jack = new Managers(6500,1.5,"mobile");
	$jack->getInfo();

		?>