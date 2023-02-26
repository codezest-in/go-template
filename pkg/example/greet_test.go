package example

import "testing"

func TestGreet(t *testing.T) {
	want := "Hello!"
	if got := Greet(); got != want {
		t.Errorf("Greet() = %v, want = %v", got, want)
	}
}
