function isPrime(number) {
    for (let i = 2; i < number - 1; i++) {
        if (number % i === 0) {
            return false
        }
    }
    return true
}

// console.log(isPrime(2))
// console.log(isPrime(10))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))

module.exports = isPrime