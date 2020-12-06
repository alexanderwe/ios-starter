 if mint list | grep -q 'SwiftFormat'; then
    mint run swiftformat --lenient --lint "$SRCROOT"
else
    echo "error: SwiftFormat not installed; run 'mint bootstrap' to install"
fi