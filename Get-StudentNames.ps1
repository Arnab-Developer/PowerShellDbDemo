using namespace System.Collections.Generic
using namespace System.Data
using namespace System.Data.SqlClient

class Student
{
    hidden [int] $Id
    hidden [string] $FirstName
    hidden [string] $LastName

    Student([int] $id, [string] $firstName,	[string] $lastName)
    {
        $this.Id = $Id
        $this.FirstName = $firstName
        $this.LastName = $lastName
    }

    [string] ToString()
    {
        return [string]::Concat("Id: ", $this.Id, ", Name: ", $this.FirstName, " ", $this.LastName)
    }
}

class StudentRepo
{
    [IEnumerable[Student]] GetStudents()	
    {
        [DataTable] $studentTable = $this.GetStudentTable()		
        [IEnumerable[Student]] $students = $this.GetStudentsFromDataTable($studentTable)
        return $students
    }

    [DataTable] GetStudentTable()
    {
        [string] $conString = "Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=StudentDb;Integrated Security=True"
        [string] $query = "SELECT ID, FirstName, LastName FROM Students"
        [SqlConnection] $sqlConnection = $null
        [SqlCommand] $sqlCommand = $null
        [SqlDataAdapter] $sqlDataAdapter = $null		
        try
        {
            $sqlConnection = [SqlConnection]::new($conString)
            $sqlCommand = [SqlCommand]::new($query, $sqlConnection)
            $sqlDataAdapter = [SqlDataAdapter]::new($sqlCommand)
            $studentTable = [DataTable]::new()

            $sqlDataAdapter.Fill($studentTable)
            return $studentTable
        }
        finally
        {
            $sqlConnection.Dispose()
            $sqlCommand.Dispose()
            $sqlDataAdapter.Dispose()
        }
    }

    [IEnumerable[Student]] GetStudentsFromDataTable([DataTable] $studentTable)
    {
        [IEnumerable[Student]] $students = [List[Student]]::new()
        foreach ($studentRow in $studentTable.Rows)
        {
            $student = [Student]::new($studentRow["ID"], $studentRow["FirstName"], $studentRow["LastName"])
            $students.Add($student)
        }
        return $students
    }
}

$studentRepo = [StudentRepo]::new()
[IEnumerable[Student]] $students = $studentRepo.GetStudents()
foreach ($student in $students)
{
    Write-Host $student
}