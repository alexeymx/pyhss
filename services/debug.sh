#!/bin/bash
# Debug script for PyHSS services
# Runs all essential services in the background and waits for them to complete

echo "Starting PyHSS services in debug mode..."

# Run each service in the background
python apiService.py &
python hssService.py &
python diameterService.py &

# Store current process PID to track children
PID=$$

# Trap Ctrl+C to properly terminate all child processes
trap 'echo "Stopping all services..."; kill $(jobs -p); exit' SIGINT SIGTERM

# Wait for all background processes to complete
echo "Services started. Press Ctrl+C to stop all services."
wait

echo "All services have terminated."