using System;
using System.Collections.Generic;
using System.IO;

class Person {
    public int age;     
	public Person(int initialAge) {
        // Add some more code to run some checks on initialAge
        if (initialAge < 0) {
            Console.WriteLine("Age is not valid, setting age to 0.");
            this.age = 0;
        }
        else {
            this.age = initialAge;
        }
     }
     public void AmIold() {
        // Do some computations in here and print out the correct statement to the console 
        if (this.age >= 18) 
        {
            Console.WriteLine("You are old.");
        } 
        else if (this.age >= 13 & this.age < 18) 
        {
            Console.WriteLine("You are a teenager.");
        } 
        else 
        {
            Console.WriteLine("You are young.");
        }
     }

     public void YearPasses() {
        // Increment the age of the person in here
        this.age = age + 1;
     }

static void Main(String[] args) {
        if (int.TryParse(Console.ReadLine(), out int T))
        {
            for (int i = 0; i < T; i++)
            {
                if (int.TryParse(Console.ReadLine(), out int age))
                {
                    Person p = new(age);
                    p.AmIold();
                    for (int j = 0; j < 3; j++)
                    {
                        p.YearPasses();
                    }
                    Console.WriteLine("3 years have passed");
                    p.AmIold();
                    Console.WriteLine();
                }
                else
                {
                    Console.WriteLine("Entrada inválida para a idade.");
                }
            }
        }
        else
        {
            Console.WriteLine("Entrada inválida para o número de casos");
        }
    }
}

