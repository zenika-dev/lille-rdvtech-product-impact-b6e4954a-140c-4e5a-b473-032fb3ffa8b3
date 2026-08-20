package com.zenika;

import java.math.BigDecimal;

public record Material(
    String id,
    BigDecimal weightInGram
) {}
