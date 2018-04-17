enum week {
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday
};

void main() 
{
  enum week day = Monday;
  int i;

  switch (day) {
   case Wednesday:
     i += 5;
     break;
   case Monday: 
     i += 3;
     break;
   case Friday:
     i += 7;
     break;
   case Saturday:
     i += 8;
     break;
   case Tuesday:
     i += 4;
     break;
   default: 
     i += 9;
  }
}

