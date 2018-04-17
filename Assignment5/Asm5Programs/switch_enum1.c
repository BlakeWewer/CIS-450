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
   case Friday:
     i += 7;
     break;
   case Wednesday:
     i += 5;
     break;
   default: 
     i += 9;
  }
}

