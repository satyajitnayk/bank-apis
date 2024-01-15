package util

import (
	"fmt"
	"math/rand"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyz"

func init() {
	rand.New(rand.NewSource(time.Now().UnixNano()))
}

// random int b/w min & max
func RandomInt(min, max int64) int64 {
	return min + rand.Int63n(max-min+1)
}

// generates a random string of a specified length n using characters from a predefined alphabet.
func RandomString(n int) string {
	// Initialize a strings.Builder to efficiently build the string
	var sb strings.Builder
	k := len(alphabet)

	// Loop n times to generate n random characters
	for i := 0; i < n; i++ {
		// Choose a random character from the alphabet
		c := alphabet[rand.Intn(k)]
		// Append the chosen character to the strings.Builder
		sb.WriteByte(c)
	}

	return sb.String()
}

func RandomOwner() string {
	return RandomString(6)
}

func RandomMoney() int64 {
	return RandomInt(0, 1000)
}

func RandomCurrency() string {
	currencies := []string{USD, EUR, CAD}
	n := len(currencies)
	return currencies[rand.Intn(n)]
}

func RandomEmail() string {
	return fmt.Sprintf("%s@email.com", RandomString(6))
}
