// Package parsinglogfiles contains functions to parse log files.
package parsinglogfiles

import (
	"fmt"
	"regexp"
)

// IsValidLine tests if a log is valid
func IsValidLine(text string) bool {
	re := regexp.MustCompile(`^\[(ERR|INF)\]`)
	return re.MatchString(text)
}

// SplitLogLine splits a log where the delimiter matches angle brackets opened and closed
func SplitLogLine(text string) []string {
	re := regexp.MustCompile(`<\W*>`)
	return re.Split(text, -1)
}

// CountQuotedPasswords counts lines where some version of password (up/down cased) appears inside of quotes
func CountQuotedPasswords(lines []string) int {
	re := regexp.MustCompile(`".*[pP][aA][sS][sS][wW][oO][rR][dD].*"`)
	var count int
	for _, line := range lines {
		if re.MatchString(line) {
			count++
		}
	}
	return count
}

// RemoveEndOfLineText removes end-of-lineNNN where NNN is some digit string, all occurances
func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line\d+`)
	return re.ReplaceAllString(text, "")
}

// TagWithUserName finds the user name and tags the log line with it
func TagWithUserName(lines []string) []string {
	re := regexp.MustCompile(`User\s+(\w+)`)
	var result []string
	for _, line := range lines {
		match := re.FindStringSubmatch(line)
		if match != nil {
			name := match[1]
			newLine := fmt.Sprintf("[USR] %s %s", name, line)
			result = append(result, newLine)
		} else {
			result = append(result, line)
		}
	}
	return result
}
