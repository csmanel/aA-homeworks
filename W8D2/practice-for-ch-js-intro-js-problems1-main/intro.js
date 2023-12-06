function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase);
}

function fizzbuzz(array) {
  const fizzBuzzArr = [];

  array.forEach((el) => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });
  return fizzBuzzArr;
}

function isPrime(n) {
  if (n < 2) {
    return false;
  }

  for (let i = 2; i < n; i++) {
    if (n % u === 0) {
      return false;
    }
  }
  return true;
}

function sumOfNprimes(n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }
  return sum;
}
// Phase I - Callbacks

// defining the function
function titleize(names, callback) {
  let titleized = names.map((name) => `Mx. ${name} Jingleheimer Schmidt`);
  callback(titleized);
}

// invoking the function
titleize(['Mary', 'Brian', 'Leo'], (names) => {
  names.forEach((name) => console.log(name));
});

// Phase II - Constructors, Prototypes, and `this`

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  trickIndex = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

// Phase III - Function Invocation

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

// Phase IV - Closures

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
}
