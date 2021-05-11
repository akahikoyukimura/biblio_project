package com.util.db;

public class Test {
	public static void main(String[] args) {
		int nb =0;
		StudentManager bm = new StudentManager();
		Student s= new Student("kawtar","aze","admin");
		//Book b= new Book("php", "server side language", "sami");
		nb = bm.addStudent(s);
		System.out.println(nb + " inserted ...");
		
	}
}
