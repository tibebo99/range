// SPDX-License-Identifier: GPLv3
pragma solidity ^0.8.13;

interface IRangePoolStructs {
    
    //TODO: adjust nearestTick if someone burns all liquidity from current nearestTick
    struct PoolState {
        uint8   unlocked;
        uint16  swapFee;
        int24   tickSpacing;
        int24   nearestTick;
        uint32  observationIndex;
        uint128 liquidity;             /// @dev Liquidity currently active
        uint128 liquidityGlobal;       /// @dev Globally deposited liquidity
        uint160 price;                 /// @dev Starting price current
        uint160 secondsGrowthGlobal;   /// @dev Multiplied by 2^128.
        uint216 feeGrowthGlobal0;
        uint216 feeGrowthGlobal1;
    }

    struct Tick {
        int24 previousTick;
        int24 nextTick;
        int128 liquidityDelta;
        uint216 feeGrowthOutside0; // Per unit of liquidity.
        uint216 feeGrowthOutside1;
        uint160 secondsGrowthOutside;
    }

    struct Position {
        uint128 liquidity;
        uint256 feeGrowthInside0Last;
        uint256 feeGrowthInside1Last;
        uint128 amount0;
        uint128 amount1;
    }

    struct Observation {
        uint32 blockTimestamp;
        int56 tickSeconds;
        uint160 secondsPerLiquidityUnit;
    }

    struct ProtocolFees {
        uint128 token0;
        uint128 token1;
    }

    //TODO: should we have a recipient field here?
    struct AddParams {
        address owner;
        int24 lowerOld;
        int24 lower;
        int24 upper;
        int24 upperOld;
        uint128 amount;
    }

    struct RemoveParams {
        address owner;
        int24 lower;
        int24 upper;
        uint128 amount;
        uint128 amount0;
        uint128 amount1;
    }

    struct UpdateParams {
        address owner;
        int24 lower;
        int24 upper;
        int128 amount;
    }

    struct ValidateParams {
        int24 lowerOld;
        int24 lower;
        int24 upper;
        int24 upperOld;
        uint128 amount0;
        uint128 amount1;
        PoolState state;
    }

    //TODO: optimize this struct
    struct SwapCache {
        uint256 input;
        uint256 output;
        uint256 feeAmount;
    }

    struct PositionCache {
        Position position;
        uint160 priceLower;
        uint160 priceUpper;
    }

    struct UpdatePositionCache {
        Position position;
        uint160 priceLower;
        uint160 priceUpper;
        bool removeLower;
        bool removeUpper;
        int128 amountInDelta;
        int128 amountOutDelta;
    }
}
    
    