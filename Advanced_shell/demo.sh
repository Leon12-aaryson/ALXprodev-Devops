#!/bin/bash

# Pokémon API Automation Demo Script
# Demonstrates all the functionality of the Pokémon API automation scripts

echo "🎮 Pokémon API Automation Demo"
echo "================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "🔍 Checking prerequisites..."
if ! command_exists curl; then
    print_error "curl is not installed. Please install curl first."
    exit 1
fi

if ! command_exists jq; then
    print_error "jq is not installed. Please install jq first."
    exit 1
fi

print_success "All prerequisites are satisfied!"
echo ""

# Step 1: API Request Automation
echo "📡 Step 1: API Request Automation"
echo "----------------------------------"
print_status "Fetching Pikachu data from Pokémon API..."
if ./apiAutomation-0x00; then
    print_success "Pikachu data fetched successfully!"
else
    print_error "Failed to fetch Pikachu data"
    exit 1
fi
echo ""

# Step 2: Data Extraction
echo "🔍 Step 2: Data Extraction"
echo "---------------------------"
print_status "Extracting specific data from Pikachu response..."
if ./data_extraction_automation-0x01; then
    print_success "Data extraction completed!"
else
    print_error "Failed to extract data"
    exit 1
fi
echo ""

# Step 3: Batch Processing (Sequential)
echo "🔄 Step 3: Batch Processing (Sequential)"
echo "----------------------------------------"
print_status "Fetching data for multiple Pokémon sequentially..."
if ./batchProcessing-0x02; then
    print_success "Sequential batch processing completed!"
else
    print_error "Failed to complete sequential batch processing"
    exit 1
fi
echo ""

# Step 4: Data Summary
echo "📊 Step 4: Data Summary"
echo "-----------------------"
print_status "Generating summary report for all Pokémon..."
if ./summaryData-0x03; then
    print_success "Summary report generated successfully!"
else
    print_error "Failed to generate summary report"
    exit 1
fi
echo ""

# Step 5: Parallel Processing
echo "⚡ Step 5: Parallel Processing"
echo "------------------------------"
print_status "Fetching data for multiple Pokémon in parallel..."
if ./batchProcessing-0x04; then
    print_success "Parallel processing completed!"
else
    print_error "Failed to complete parallel processing"
    exit 1
fi
echo ""

# Final Summary
echo "🎉 Demo Completed Successfully!"
echo "================================"
echo ""
print_status "Files created:"
echo "  📄 data.json - Single Pokémon (Pikachu) data"
echo "  📁 pokemon_data/ - Directory containing all Pokémon data files"
echo "  📊 pokemon_report.csv - Summary report with statistics"
echo "  📝 errors.txt - Error log (if any errors occurred)"
echo ""

print_status "You can now:"
echo "  • View Pikachu data: jq . < data.json"
echo "  • View any Pokémon data: jq . < pokemon_data/bulbasaur.json"
echo "  • Check the summary: cat pokemon_report.csv"
echo "  • Review errors: cat errors.txt"
echo ""

print_success "All Pokémon API automation scripts are working correctly!"
