//============================================================================
// Name        : staffprog.cpp
// Author      : Neha
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include<string>
using namespace std;
class Shape
{
protected:
	float area;
	//string name;
public:
	Shape()
{
	this->area=0;

}
 virtual void calculateArea()=0;
 void setArea(float area)
 {
	 this->area=area;

}
float getArea()
{
	return this->area;
}
//void setname(string name)
//{
//	this->name=name;
//}
//string getname()
//{
//	return this->name;
//}
~Shape()
{
}

};
class Circle:public Shape
{
private:
 int radius;
public:
 Circle()
{
	this->radius=0;
}
 void setRadius(int radius)
 {
	 this->radius=radius;
 }
 int getRadius()
 {
	 return this->radius;
}

 virtual void calculateArea()
 {
	cout<<"enter the radius::"<<endl;
	this->area= 3.14*this->radius*this->radius;
}
 ~Circle()
 {

 }
};
class Rectangle:public Shape
{
private:
	int length,breadth;
public:
	Rectangle()
{
	this->length=0;
	this->breadth=0;
}
	void setLength(int length)
	{
		this->length=length;
	}
	int getLength()
	{
		return this->length;
	}
	void setBreadth(int breadth)
		{
			this->breadth=breadth;
		}
		int getBreadth()
		{
			return this->breadth;
		}
virtual void calculateArea()
{
	cout<<"enter the length and breadth::"<<endl;
	this->area=length*breadth;
}
	~Rectangle()
	{

	}
};

void acceptRecord(Shape *ptr)
{//
//	float area;
//	cout<<"enter the name::"<<endl;
//	cin>>name;
	//ptr->setname(name);
    if(dynamic_cast<Circle*>(ptr)!=0)
    {
    	Circle *ts  =dynamic_cast<Circle*>(ptr);
    	int radius;
    	cout<<"radius is"<<endl;
    	cin>>radius;
    	ts->setRadius(radius);
    }
    else
    {
    	Rectangle *nts  =dynamic_cast<Rectangle*>(ptr);
    	int length;
    	int breadth;
    	cout<<"length="<<endl;
    	cin>>length;
    	nts->setLength(length);
    	cout<<"breadth="<<endl;
    	 cin>>breadth;
    	nts->setBreadth(breadth);

    }


}
void printRecord(Shape *ptr)
{
	cout<<"\n area::"<<ptr->getArea()<<endl;
	//cout<<"salary of teaching and nonteaching staff::"<<ptr->getsal();
}
int Menuchoice();
int main()
{
	int choice;
	while((choice= ::Menuchoice())!=0)
	{
		Shape *ptr=NULL;
		switch(choice)
		{
		case 1:
			ptr =new Circle();
			break;

		case 2:
			ptr=new Rectangle();
			break;
	  }
	  if(ptr!=NULL)
	  {
		  ::acceptRecord(ptr);
		  ptr->calculateArea();
		  ::printRecord(ptr);

	 }
}
return 0;
}
int Menuchoice()
{
int choice;
cout<<"0.Exit"<<endl;
cout<<"1.Circle"<<endl;
cout<<"2.Rectangle"<<endl;
cout<<"Enter the choice"<<endl;
cin>>choice;
return choice;
}

