# 🐚 BASH QUICK REFERENCE

> ‼️ **Before making a long loop/conditional → can a command already do it?**

---

## 🔢 1. NUMBERS

### Arithmetic
```bash
$((x + y))      # add
$((x - y))      # subtract
$((x * y))      # multiply
$((x / y))      # divide ⚠️ integer only
$((x % y))      # remainder
$((x ** y))     # power

x=$((x + 1))
((x++))
((x += 5))
```

### Compare numbers
```bash
-eq     # equal
-ne     # not equal
-gt     # >
-ge     # >=
-lt     # <
-le     # <=
```

```bash
[ "$x" -gt "$y" ]
```

### Decimals ⚠️
```bash
echo "$x / $y" | bc -l
printf "%.2f\n" "$(echo "$x / $y" | bc -l)"
```

---

## 🔤 2. STRINGS

```bash
[ "$a" = "$b" ]       # equal
[ "$a" != "$b" ]      # not equal
[ -z "$a" ]           # empty
[ -n "$a" ]           # not empty
```

### Join
```bash
full="$first $last"
file="$name.txt"
```

### Quick operations
```bash
${#word}               # length
${word:0:3}            # substring
```

> ‼️ Numbers → `-eq`  
> ‼️ Strings → `=`

---

## 📦 3. VARIABLES & ARGUMENTS

```bash
name="Canada"          # NO spaces around =

$0     # script
$1     # argument 1
$2     # argument 2
$#     # number of arguments
```

### ‼️ Quote variables
```bash
"$country"
```

→ preserves `"South Africa"` as ONE argument.

---

## 🚦 4. CONDITIONS

```bash
if [ condition ]; then
    ...
elif [ condition ]; then
    ...
else
    ...
fi
```

### ‼️ COMMANDS CAN BE CONDITIONS

```bash
if command; then
    ...
fi
```

```text
exit 0      → TRUE / success ✅
non-zero    → FALSE / failure ❌
```

```bash
if grep "Canada" file; then
    ...
fi
```

### Previous command
```bash
$?          # exit status
```

### Short logic
```bash
cmd1 && cmd2       # cmd2 if cmd1 succeeds
cmd1 || cmd2       # cmd2 if cmd1 fails
```

💡 Can save a small `if`.

---

## 🔁 5. LOOPS

### for
```bash
for item in list; do
    ...
done
```

```bash
for ((i=1; i<=10; i++)); do
    ...
done
```

### while
```bash
while condition; do
    ...
done
```

```bash
while read line; do
    ...
done
```

> ‼️ `read` itself is the TRUE/FALSE condition.

---

## 🔀 6. CASE

```bash
case "$1" in
    pattern1)
        ...
        ;;

    pattern2 | pattern3)
        ...
        ;;

    *)
        ...             # default / else
        ;;
esac
```

---

# 📥 7. `read` — INPUT

```bash
read x
```

→ next stdin line → `x`

### ‼️ Repeated `read` continues where it stopped

Input:
```text
3
10
20
30
```

```bash
read n                  # n=3

while read x; do        # continues with 10
    ...
done
```

💡 **First line special? → `read` it first.**

---

### ‼️ Split ONE line into variables

```bash
read date time level message
```

Input:
```text
2026-09-20 14:02 INFO Server started
```

```text
date    → 2026-09-20
time    → 14:02
level   → INFO
message → Server started
```

> ⭐ Last variable gets the remainder.

💡 May save `cut` / extra parsing.

---

### Useful
```bash
read -p "Name: " name    # prompt
read -r line             # preserve \
IFS= read -r line        # preserve line safely
read                     # result → $REPLY
```

---

# 🔗 8. PIPES & REDIRECTION

```bash
cmd1 | cmd2
```

→ stdout of `cmd1` becomes stdin of `cmd2`.

```bash
> file          # overwrite/create
>> file         # append
```

### stderr
```bash
echo "error" >&2
exit 1
```

```text
1 → stdout
2 → stderr
```

### ‼️ FILTER EARLY
```text
❌ process everything → filter
✅ filter → process smaller result
```

---

# 🔎 9. `grep` — FIND / FILTER LINES

```bash
grep "cat" file         # contains cat
grep -i "cat" file      # ignore case
grep -x "cat" file      # whole line = cat
grep -v "cat" file      # NOT matching
grep -c "cat" file      # count matches
grep -n "cat" file      # line numbers
```

### 💡 Think `grep` before:
```text
loop + if matching
manual exclusions
manual match counting
```

---

## 🧩 Basic regex

```text
^cat        starts with cat
cat$        ends with cat
.           any character
[^,]        anything except comma
*           repeat previous pattern 0+ times
```

```text
[^,]*,      one CSV field + comma
```

Example:
```bash
grep "^[^,]*,[^,]*,[^,]*,$country," file.csv
```

→ `$country` must be field 4.

---

# ✂️ 10. `cut` — EXTRACT

```bash
cut -d',' -f4 file      # field 4
cut -d',' -f1,4 file    # fields 1 + 4
cut -d',' -f1-4 file    # fields 1 → 4
cut -d',' -f4- file     # field 4 → end

cut -c1-5 file          # characters 1 → 5
```

💡 Predictable columns → think `cut`.

---

# 🧮 11. `awk` — FIELDS + LOGIC

```bash
awk '{print $1}' file
```

→ field 1

```bash
awk -F',' '{print $4}' file
```

→ comma-separated field 4

```bash
awk -F',' '{print $1, $4}' file
```

→ fields 1 + 4

```bash
awk -F',' '$4 == "Canada" {print $1}' file
```

→ if field 4 = Canada → print field 1

### 💡 Think `awk` when:
```text
fields + condition
fields + calculation
```

> ⚠️ Simple extraction only? `cut` may be clearer.

---

# 📊 12. `wc` — WORD COUNT

```bash
wc -l       # lines
wc -w       # words
wc -c       # bytes
```

### ‼️ Algorithm saver
```bash
rows-for "$1" | wc -l
```

💡 **1 line = 1 item? → `wc -l` instead of counter loop.**

---

# 🔃 13. `sort` + `uniq`

```bash
sort file           # alphabetical
sort -n file        # numeric
sort -r file        # reverse
sort -u file        # sort + unique
```

```bash
uniq file           # remove ADJACENT duplicates
uniq -c file        # count adjacent duplicates
```

Common:
```bash
sort file | uniq
sort file | uniq -c
```

💡 Unique values → `sort -u`  
💡 Frequencies → `sort | uniq -c`

---

# 📄 14. `head` + `tail`

```bash
head file           # first 10
head -n 3 file      # first 3

tail file           # last 10
tail -n 3 file      # last 3
tail -n +2 file     # line 2 → end
```

💡 Remove header:
```bash
tail -n +2 file.csv
```

---

# 🔤 15. `tr` — CHARACTERS

```bash
tr 'a-z' 'A-Z'      # lowercase → uppercase
tr -d ','            # delete commas
```

💡 Simple character replacement/deletion → `tr`.

---

# 🔧 16. COMMAND SUBSTITUTION

```bash
$(command)
```

→ replace with command's output.

```bash
today="$(date +%F)"
```

```bash
result="$(grep "Canada" file)"
```

### ⚠️ Don't confuse:
```bash
$(command)       # command output
$((x + y))       # arithmetic
```

---

# 🧩 17. FUNCTIONS

```bash
function greet() {
    echo "Hello $1"
}

greet "Bob"
```

Functions can feed pipelines:

```bash
rows-for "$1" | wc -l
```

---

# 📁 18. FILE TESTS

```bash
[ -e "$file" ]       # exists
[ -f "$file" ]       # regular file
[ -d "$file" ]       # directory
[ -r "$file" ]       # readable
[ -w "$file" ]       # writable
[ -x "$file" ]       # executable
```

---

# 🧠 ‼️ ALGORITHM-SAVERS

### Before writing a long solution:

```text
Need each line?
→ while read

First line special?
→ read it first, then continue

Need line split into variables?
→ read a b c

Need matching lines?
→ grep

Need NON-matching lines?
→ grep -v

Need number of matches?
→ grep -c
→ grep ... | wc -l

Need one column?
→ cut

Need fields + logic/calculation?
→ awk

Need count of records?
→ wc -l

Need unique values?
→ sort -u

Need frequencies?
→ sort | uniq -c

Need first lines?
→ head

Need later/last lines?
→ tail

Need character replacement?
→ tr

Need success/failure?
→ command itself can be condition

Need command output?
→ $(command)

Need multiple operations?
→ cmd1 | cmd2 | cmd3
```

---

# 🚨 QUICK TRAPS

```text
🔢 Number comparison → -eq, -gt, -lt...
🔤 String comparison → =, !=

"$variable"
→ quote when spaces are possible

$((7 / 2))
→ 3 ⚠️ integer division

grep -x
→ WHOLE LINE, NOT case-sensitive

grep -i
→ ignore case

> results
→ creates/overwrites FILE "results"
→ NOT variable $results

$?
→ status of most recent command

uniq
→ only adjacent duplicates

0
→ success / TRUE in Bash
```

---

# 🧰 COMMAND TOOLBOX

```text
📥 read      → consume / split input
🔎 grep      → find / filter
✂️ cut       → extract columns
🧮 awk       → fields + logic/calculation
📊 wc        → count
🔃 sort      → order
🧹 uniq      → duplicates/frequencies
📄 head      → first lines
📄 tail      → later/last lines
🔤 tr        → character transformation
🖨️ printf    → formatted output
📅 date      → date/time
```

---

# ⭐ FINAL HABIT

> ‼️ **Before adding another loop, counter, or conditional:**
>
> **“Does Bash/Unix already have this operation?”**

```text
LOOP       → command?
COUNTER    → wc / grep -c?
MATCHING   → grep?
SPLITTING  → read / cut / awk?
DUPLICATES → sort / uniq?
SUCCESS    → exit status?
BIG DATA   → filter earlier?
```
