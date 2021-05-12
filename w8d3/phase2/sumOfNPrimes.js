const isPrime = require("./isPrime")

const firstNPrimes = n => {
    const primes = [];
    for (let i = 2; primes.length < n; i++) {
        if (isPrime(i)) {
            primes.push(i)
        }
    }
    return primes
}
console.log(firstNPrimes(4))

function sumOfNPrimes(n) {
    const primes = firstNPrimes(n)
    return primes.reduce(function(acc, el){return acc + el})
}

console.log(sumOfNPrimes(4))