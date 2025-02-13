String truncateAddress(String address) => address.length > 10
    ? '${address.substring(0, 6)}...${address.substring(address.length - 4)}'
    : address;
