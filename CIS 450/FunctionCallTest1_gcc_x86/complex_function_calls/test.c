int h(int hp1, int hp2, int hp3, int hp4, int hp5) {
  int h1;

  hp1++;
  h1 = hp2 + 3;
  hp2 = hp3 + hp4;
  return hp1 + hp2 + hp3 + hp4 + hp5 + h1;
}

int g(int gp1, int gp2, int gp3) {
  int g1, g2;
  return gp1 + gp2 + gp3 + g1 + g2;
}

void f(int fp1, int fp2, int fp3) {
  int f1, f2, f3;

  f1 = g(fp1, f1, f2);
  f2 = h(fp2, fp3, f1, f2, f3);
}

void main() {
  int m1, m2, m3;
  f(m1, m2, m3);
}

