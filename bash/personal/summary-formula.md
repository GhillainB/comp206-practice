# 🐚 BASH QUICK REFERENCE

<a id="contents"></a>
## 📑 Contents

- [🔢 1. NUMBERS](#section-1)
- [🔤 2. STRINGS](#section-2)
- [📦 3. VARIABLES & ARGUMENTS](#section-3)
- [🚦 4. CONDITIONS](#section-4)
- [🔁 5. LOOPS](#section-5)
- [🔀 6. CASE](#section-6)
- [📥 7. read — INPUT](#section-7)
- [🔗 8. PIPES & REDIRECTION](#section-8)
- [🔎 9. grep — FIND / FILTER LINES](#section-9)
- [✂️ 10. cut — EXTRACT](#section-10)
- [🧮 11. awk — FIELDS + LOGIC](#section-11)
- [📊 12. wc — WORD COUNT](#section-12)
- [🔃 13. sort + uniq](#section-13)
- [📄 14. head + tail](#section-14)
- [🔤 15. tr — CHARACTERS](#section-15)
- [🔧 16. COMMAND SUBSTITUTION](#section-16)
- [🧩 17. FUNCTIONS](#section-17)
- [📁 18. FILE TESTS](#section-18)
- [🧠 ‼️ ALGORITHM-SAVERS](#algorithm-savers)
- [🚨 QUICK TRAPS](#quick-traps)
- [🧰 COMMAND TOOLBOX](#command-toolbox)
- [⭐ FINAL HABIT](#final-habit)

---


> ‼️ **Before making a long loop/conditional → can a command already do it?**

---

<a id="section-1"></a>

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

> ⚠️ Division: denominator must not be zero. `bc` needs to be installed.

### Decimals ⚠️
```bash
echo "$x / $y" | bc -l
printf "%.2f\n" "$(echo "$x / $y" | bc -l)"
printf "%.3f\n" "$(echo "$sum / $n" | bc -l)"  # average; n > 0
```

---

[⬆️ Back to contents](#contents)

<a id="section-2"></a>

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

[⬆️ Back to contents](#contents)

<a id="section-3"></a>

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

[⬆️ Back to contents](#contents)

<a id="section-4"></a>

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

### Brackets at a glance
```bash
[ "$x" -gt 0 ]                    # test; spaces around [ and ]
[[ "$name" = "Bob" && "$x" -gt 0 ]] # Bash test + combined conditions
(( x > 0 && x < 100 ))            # Bash arithmetic condition
```

- `(( expression ))`: nonzero value → success; zero → failure.
- `[ ... ]`: combine separate tests with `&&` / `||`.
- `else` has no `then`.

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
if grep -qF "Canada" file; then
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

[⬆️ Back to contents](#contents)

<a id="section-5"></a>

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
while IFS= read -r line; do
    ...
done
```

> ‼️ `read` itself is the TRUE/FALSE condition.

---

### Skip / stop
```bash
continue    # next loop iteration
break       # leave loop
```

[⬆️ Back to contents](#contents)

<a id="section-6"></a>

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

> ‼️ `case` matches patterns; `x=y` is not a numeric comparison.

```bash
case "$answer" in
    [yY]) echo "YES" ;;
    [nN]) echo "NO" ;;
esac
```

[⬆️ Back to contents](#contents)

<a id="section-7"></a>

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
read -n 3 code           # up to 3 characters; newline may stop it
read -N 3 code           # exactly 3 characters unless EOF
IFS=, read -r city pop country  # split using commas
```

---

> ⚠️ `IFS= read -r` preserves leading/trailing spaces and backslashes.
> Plain `read line` still reads one line; it does not turn words into separate lines.
> `IFS=, read` handles simple delimited text, not CSV quoting.

```bash
while IFS= read -r line; do
    printf "%s\n" "$line"
done < input.txt
```

[⬆️ Back to contents](#contents)

<a id="section-8"></a>

# 🔗 8. PIPES & REDIRECTION

```bash
cmd1 | cmd2
```

→ stdout of `cmd1` becomes stdin of `cmd2`.

```bash
> file          # overwrite/create
>> file         # append
< file          # read file as stdin
2> errors.txt   # stderr → file
```

> 🚨 Never use `command < file > file`: `>` empties the file before reading.
> ⚠️ `producer | while ...` usually runs the loop in a subshell: variable changes do not survive outside it.

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

[⬆️ Back to contents](#contents)

<a id="section-9"></a>

# 🔎 9. `grep` — FIND / FILTER LINES

```bash
grep "cat" file         # contains cat
grep -i "cat" file      # ignore case
grep -x "cat" file      # whole line = cat
grep -v "cat" file      # NOT matching
grep -c "cat" file      # count matching LINES
grep -w "cat" file      # whole word
grep -F "a.b" file      # literal text, not regex
grep -q "cat" file      # quiet; use exit status
grep -iwE "the|that|then|those" file  # any whole word; ignore case
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

→ `$country` must match field 4.

> ⚠️ This assumes simple comma-separated fields and a following comma.
> `$country` is interpreted as regex here; literal field comparison → `awk`.

```text
Extended regex (grep -E):
cat|dog     either pattern
(cat|dog)   group
[0-9]       one digit
+           previous pattern 1+ times
?           previous pattern 0 or 1 time
{4}         previous pattern exactly 4 times
```

---

[⬆️ Back to contents](#contents)

<a id="section-10"></a>

# ✂️ 10. `cut` — EXTRACT

```bash
cut -d',' -f4 file      # field 4
cut -d',' -f1,4 file    # fields 1 + 4
cut -d',' -f1-4 file    # fields 1 → 4
cut -d',' -f4- file     # field 4 → end

cut -c1-5 file          # characters 1 → 5
cut -c2,7 file          # characters 2 and 7
cut -c-4 file           # start → character 4
cut -c4- file           # character 4 → end
cut -f2- file           # tab-separated fields 2 → end
cut -d " " -f2- file    # space-separated fields 2 → end
```

💡 Predictable columns → think `cut`.

- `-c`: character positions; `-f`: fields; positions start at **1**.
- Default field delimiter: **TAB**. `-d` selects one character.
- ‼️ `-d ''` does not mean space. Use `-d ' '`.
- Repeated spaces create empty fields; whitespace-separated words → `awk`.
- `cut` extracts; it does not edit the source file.

---

[⬆️ Back to contents](#contents)

<a id="section-11"></a>

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

```bash
awk -F',' -v country="$country" '$4 == country {print $0}' file
```

→ literal field comparison; `$0` = whole line.

> ⚠️ `cut` / `awk -F,` are for simple fields; quoted CSV commas need a CSV parser.

### 💡 Think `awk` when:
```text
fields + condition
fields + calculation
```

> ⚠️ Simple extraction only? `cut` may be clearer.

---

[⬆️ Back to contents](#contents)

<a id="section-12"></a>

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

[⬆️ Back to contents](#contents)

<a id="section-13"></a>

# 🔃 13. `sort` + `uniq`

```bash
sort file           # alphabetical
sort -n file        # numeric
sort -r file        # reverse
sort -u file        # sort + unique
sort -rn file       # numeric, descending
sort -t "|" -k2,2nr file   # field 2; numeric, descending
sort -t $'\t' -k2,2n file # TAB delimiter; field 2, ascending
```

```bash
uniq file           # remove ADJACENT duplicates
uniq -c file        # count adjacent duplicates
uniq -i file        # compare ignoring case
uniq -u file        # only lines occurring once in their adjacent group
uniq -d file        # one copy of each repeated adjacent group
```

> ⭐ `-k2,2`: key starts AND ends at field 2; `-k2` extends to line end.
> `sort -u` keeps one copy; `uniq -u` excludes repeated groups entirely.

Common:
```bash
sort file | uniq
sort file | uniq -c
```

💡 Unique values → `sort -u`  
💡 Frequencies → `sort | uniq -c`

---

[⬆️ Back to contents](#contents)

<a id="section-14"></a>

# 📄 14. `head` + `tail`

```bash
head file           # first 10
head -n 3 file      # first 3

tail file           # last 10
tail -n 3 file      # last 3
tail -n +2 file     # line 2 → end
head -c 20 file     # first 20 BYTES
tail -c 20 file     # last 20 BYTES
head -n 22 file | tail -n 11  # lines 12 → 22 inclusive
```

> ⭐ Lines A → B: `head -n B file | tail -n $((B - A + 1))`.
> ⚠️ Bytes may differ from characters for accented text / emojis.

💡 Remove header:
```bash
tail -n +2 file.csv
```

---

[⬆️ Back to contents](#contents)

<a id="section-15"></a>

# 🔤 15. `tr` — CHARACTERS

```bash
tr 'a-z' 'A-Z'      # lowercase → uppercase
tr -d ','            # delete commas
tr '()' '[]'         # ( → [ and ) → ]
tr -d 'a-z'          # delete lowercase letters
tr -s ' '            # squeeze repeated spaces
tr 'a' 'b' < input.txt > output.txt
```

💡 Simple character replacement/deletion → `tr`.

- ‼️ `tr` reads **stdin**; it does not take an input filename argument.
- Character sets map position by position; `tr` does not replace whole words.
- `tr -s ' '` squeezes spaces; it does not trim the first/last space.

```bash
uniq -c | tr -s ' ' | cut -c2-  # remove count padding (exercise format)
```

---

[⬆️ Back to contents](#contents)

<a id="section-16"></a>

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

[⬆️ Back to contents](#contents)

<a id="section-17"></a>

# 🧩 17. FUNCTIONS

```bash
greet() {
    echo "Hello $1"
}

greet "Bob"
```

```bash
sum() {
    local total=0 number
    while read -r number; do
        total=$((total + number))
    done
    echo "$total"
}
```

→ assumes one valid integer per line; empty input → `0`.

- Function `$1` = function argument, not necessarily script `$1`.
- `echo` / `printf` sends a value to stdout; `return` sets exit status.
- `local` keeps a variable inside the function.

Functions can feed pipelines:

```bash
rows-for "$1" | wc -l
```

---

[⬆️ Back to contents](#contents)

<a id="section-18"></a>

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

[⬆️ Back to contents](#contents)

<a id="algorithm-savers"></a>

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

[⬆️ Back to contents](#contents)

<a id="quick-traps"></a>

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

[⬆️ Back to contents](#contents)

<a id="command-toolbox"></a>

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

[⬆️ Back to contents](#contents)

<a id="final-habit"></a>

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

[⬆️ Back to contents](#contents)
