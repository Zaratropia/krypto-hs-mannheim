# krypto-hs-mannheim
Sources for KRV lesson practices
****
## Übung 1
#### Aufgabe a)
##### Usage
`ruby euklid.rb zahl1 zahl2`
##### Example
```
$ ruby euklid.rb 234 678
Check with internal function: ggT(234, 678): 6
a: 678 b: 234 r: 210 y: 2
a: 234 b: 210 r: 24 y: 1
a: 210 b: 24 r: 18 y: 8
a: 24 b: 18 r: 6 y: 1
a: 18 b: 6 r: 0 y: 3
ggT(234, 678): 6
```
#### Aufgabe b)
##### Usage
`ruby extended_euklid.rb zahl1 zahl2`
##### Example
```
$ ruby extended_euklid.rb 128 34
a: 128 b: 34
Step: r: [128, 34, 26] q: [3]
Step: r: [128, 34, 26, 8] q: [3, 1]
Step: r: [128, 34, 26, 8, 2] q: [3, 1, 3]
Step: r: [128, 34, 26, 8, 2, 0] q: [3, 1, 3, 4]
x: 4
y: -15
```
