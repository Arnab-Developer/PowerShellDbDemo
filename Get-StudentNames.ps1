using namespace System.Collections.Generic

class Student
{
	[int] $Id
	[string] $FirstName
	[string] $LastName
	[string] $Subject

	Student([int] $id, [string] $firstName,	[string] $lastName,	[string] $subject)
	{
		$this.Id = $Id
		$this.FirstName = $firstName
		$this.LastName = $lastName
		$this.Subject = $subject
	}
}

class StudentRepo
{
	[IEnumerable[Student]] GetStudents()
	{
		[IEnumerable[Student]] $students = [List[Student]]::new()

		$students.Add([Student]::new(1, "jon", "doe", "dotnet"))
		$students.Add([Student]::new(2, "mita", "roy", "javascript"))

		return $students
	}
}

$studentRepo = [StudentRepo]::new()
[IEnumerable[Student]] $students = $studentRepo.GetStudents()
foreach ($student in $students)
{
	[string] $output = [string]::Concat("Id: ", $student.Id, ", Name: ", $student.FirstName, `
		" ", $student.LastName, ", Subject: ", $student.Subject)
	Write-Host $output
}