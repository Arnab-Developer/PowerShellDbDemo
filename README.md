# PowerShell db demo

This is a demo to show how we can read SQL Server db with ADO.NET and PowerShell.

## How to run

You need PowerShell 7, .NET 5 and SQL Server installed in your computer.

- Download the PowerShell script and save in your local computer.
- Use the [db script](https://github.com/Arnab-Developer/PowerShellDbDemo/tree/main/DatabaseScripts) 
to create and populate the SQL Server db.
- Open a PowerShell terminal and navigate to the PowerShell script location.
- Execute the below command

```
.\Get-StudentNames.ps1
```

## Output

```
Id: 1, Name: jon doe
Id: 2, Name: bob miler
Id: 3, Name: mita roy
Id: 4, Name: rahul roy
Id: 5, Name: mukul dev
```