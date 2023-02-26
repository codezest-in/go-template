# `/pkg`

Library code that's ok to use by external applications (e.g., `/pkg/mypubliclib`). Other projects will import these libraries expecting them to work, so think twice before you put something here :-) Note that the `internal` directory is a better way to ensure your private packages are not importable because it's enforced by Go. The `/pkg` directory is still a good way to explicitly communicate that the code in that directory is safe for use by others.

It's also a way to group Go code in one place when your root directory contains lots of non-Go components and directories making it easier to run various Go tools. Ok not to use it if your app project is really small and where an extra level of nesting doesn't add much value (unless you really want to). Think about it when it's getting big enough and your root directory gets pretty busy (especially if you have a lot of non-Go app components).
