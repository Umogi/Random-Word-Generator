# Random Word Generator

This Lua script generates random words that follow basic phonetic and linguistic rules, ensuring the output sounds natural and plausible. The program considers vowel-consonant combinations, valid consonant pairs, and the overall structure of English-like words.

## Features

- **Vowel and Consonant Recognition**: Differentiates between vowels (`a, e, i, o, u`) and consonants.
- **Valid Consonant Pairs**:
  - Initial (e.g., `bl`, `cr`, `sk`)
  - Medial (e.g., `mb`, `nk`, `rl`)
  - Final (e.g., `sh`, `nd`, `mp`)
- **Randomized Word Length**: Words are generated with lengths ranging from 3 to 10 characters.
- **Phonetic Rules**:
  - Avoids consecutive identical vowels.
  - Incorporates valid consonant clusters.
  - Ensures natural-sounding sequences.

## How It Works

1. **Vowels and Consonants**:
   - A list of vowels and consonants is defined.
   - Random characters are selected using a weighted approach (vowels are slightly more likely).

2. **Validation Rules**:
   - Characters are added sequentially to a word.
   - Rules ensure:
     - No identical vowels occur consecutively.
     - Consonant clusters conform to predefined valid pairs.
     - Each character added adheres to phonetic rules for smooth word formation.

3. **Word Generation**:
   - A word length is randomly chosen (3–10 characters).
   - Characters are added until the desired length is achieved, following the rules above.

## Usage

### Prerequisites

- **Lua Environment**: Ensure you have Lua installed on your system.

### Running the Script

1. Save the code to a file, e.g., `word_generator.lua`.
2. Execute the script in your terminal:
   ```
   lua word_generator.lua
   ```
   The script will print a randomly generated word to the console.

## Example Output

Running the script might produce words like:
- `flent`
- `brask`
- `thinde`
- `stomp`
These outputs are random and follow the rules defined in the script.

## Customization

You can adjust the following aspects of the script to suit your preferences:
- Valid Pairs: Modify the `valid_pairs` table to add or remove valid consonant clusters.
- Word Length Range: Change the `math.random(3,10)` line to adjust minimum and maximum word lengths.
- Character Distribution: Alter the `random_choice` function to change the likelihood of selecting vowels vs. consonants.

## License
This project is open-source and available under the MIT [LICENSE](LICENSE).
