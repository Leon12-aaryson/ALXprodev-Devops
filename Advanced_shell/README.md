# Pokémon API Automation Scripts

This directory contains a comprehensive set of shell scripts for automating Pokémon API requests and data processing.

## Prerequisites

Before running these scripts, ensure you have the following tools installed:

- `curl` - For making HTTP requests
- `jq` - For JSON parsing and manipulation
- `bc` - For floating-point arithmetic (optional, fallback available)

### Installation on macOS:
```bash
# Install jq using Homebrew
brew install jq

# curl and bc are usually pre-installed
```

### Installation on Ubuntu/Debian:
```bash
sudo apt update
sudo apt install curl jq bc
```

## Scripts Overview

### 1. `apiAutomation-0x00` - API Request Automation
**Objective**: Automate the process of making API requests to the Pokémon API and saving the results to a file.

**Features**:
- Fetches Pikachu data from the Pokémon API
- Saves response to `data.json`
- Logs errors to `errors.txt`
- Includes error handling and dependency checks

**Usage**:
```bash
./apiAutomation-0x00
```

**Output**: Creates `data.json` with Pikachu's complete data

---

### 2. `data_extraction_automation-0x01` - Extract Pokémon Data
**Objective**: Use advanced text manipulation tools to extract specific data from the API response.

**Features**:
- Extracts name, height, weight, and type using `jq`
- Formats output in human-readable format
- Uses `sed` for text transformation
- Uses `awk` for output formatting

**Usage**:
```bash
./data_extraction_automation-0x01
```

**Output**: 
```
Pikachu is of type Electric, weighs 6.0kg, and is 0.4m tall.
```

**Requirements**: Must run `apiAutomation-0x00` first to generate `data.json`

---

### 3. `batchProcessing-0x02` - Batch Pokémon Data Retrieval
**Objective**: Automate the retrieval of data for multiple Pokémon and store it in separate files.

**Features**:
- Fetches data for 5 Pokémon: Bulbasaur, Ivysaur, Venusaur, Charmander, Charmeleon
- Saves each Pokémon's data to separate JSON files
- Includes rate limiting (1 second delay between requests)
- Robust error handling and retry logic (up to 3 attempts)
- Input validation for Pokémon names
- Network connectivity checks

**Usage**:
```bash
./batchProcessing-0x02
```

**Output**: Creates `pokemon_data/` directory with individual JSON files for each Pokémon

---

### 4. `summaryData-0x03` - Summarize Pokémon Data
**Objective**: Create a report that summarizes data for multiple Pokémon.

**Features**:
- Reads all JSON files from `pokemon_data/` directory
- Generates CSV report with name, height, and weight
- Calculates average height and weight
- Uses `jq` for data extraction
- Uses `bc` for calculations

**Usage**:
```bash
./summaryData-0x03
```

**Output**: Creates `pokemon_report.csv` with summary data and statistics

**Requirements**: Must run `batchProcessing-0x02` first to generate Pokémon data files

---

### 5. `batchProcessing-0x04` - Parallel Data Fetching
**Objective**: Speed up data retrieval using parallel processing.

**Features**:
- Fetches data for multiple Pokémon simultaneously
- Uses background processes and process management
- Monitors all background processes
- Provides process IDs and completion status
- Includes error logging

**Usage**:
```bash
./batchProcessing-0x04
```

**Output**: Creates `pokemon_data/` directory with individual JSON files (faster execution)

---

## Workflow

### Complete Data Pipeline:
1. **Start with API automation**: `./apiAutomation-0x00`
2. **Extract specific data**: `./data_extraction_automation-0x01`
3. **Fetch multiple Pokémon**: `./batchProcessing-0x02` (or `batchProcessing-0x04` for parallel)
4. **Generate summary report**: `./summaryData-0x03`

### Quick Parallel Processing:
If you want to skip the single Pokémon step and go straight to batch processing:
```bash
./batchProcessing-0x04
./summaryData-0x03
```

## File Structure

After running all scripts, your directory will contain:
```
Advanced_shell/
├── apiAutomation-0x00
├── data_extraction_automation-0x01
├── batchProcessing-0x02
├── batchProcessing-0x04
├── summaryData-0x03
├── README.md
├── data.json                    # Single Pokémon data
├── pokemon_data/               # Directory for multiple Pokémon
│   ├── bulbasaur.json
│   ├── ivysaur.json
│   ├── venusaur.json
│   ├── charmander.json
│   └── charmeleon.json
├── pokemon_report.csv          # Summary report
└── errors.txt                  # Error log
```

## Error Handling

All scripts include comprehensive error handling:
- **Dependency checks**: Verifies required tools are installed
- **Network validation**: Checks connectivity before making requests
- **Retry logic**: Automatically retries failed requests (up to 3 times)
- **Input validation**: Validates Pokémon names and file existence
- **Error logging**: All errors are logged to `errors.txt` with timestamps

## Rate Limiting

The scripts include rate limiting to be respectful to the Pokémon API:
- **Sequential processing**: 1 second delay between requests
- **Parallel processing**: 0.2 second delay between starting requests
- **API endpoint**: Uses the official `https://pokeapi.co/api/v2/pokemon/` endpoint

## Troubleshooting

### Common Issues:

1. **"curl command not found"**
   - Install curl: `brew install curl` (macOS) or `sudo apt install curl` (Ubuntu)

2. **"jq command not found"**
   - Install jq: `brew install jq` (macOS) or `sudo apt install jq` (Ubuntu)

3. **Network connectivity issues**
   - Check your internet connection
   - Verify firewall settings
   - Try accessing `https://pokeapi.co` in a browser

4. **Permission denied errors**
   - Make scripts executable: `chmod +x script_name`

5. **Data extraction failures**
   - Ensure `data.json` exists and contains valid JSON
   - Check that the API response structure hasn't changed

### Debug Mode:
To see more detailed output, you can modify any script to add `set -x` at the beginning for debug mode.

## API Information

- **Base URL**: `https://pokeapi.co/api/v2/pokemon/`
- **Rate Limits**: The API is free to use with reasonable rate limits
- **Data Format**: JSON responses with comprehensive Pokémon information
- **Documentation**: [PokeAPI Documentation](https://pokeapi.co/docs/v2)

## Contributing

Feel free to enhance these scripts with additional features:
- Support for more Pokémon
- Additional data extraction options
- Different output formats
- Enhanced error handling
- Performance optimizations

## License

This project is part of the ALX DevOps curriculum and is intended for educational purposes.
