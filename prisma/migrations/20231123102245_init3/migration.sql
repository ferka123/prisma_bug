-- CreateTable
CREATE TABLE `perf_types` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `perf_types_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PerfTypeToSong` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_PerfTypeToSong_AB_unique`(`A`, `B`),
    INDEX `_PerfTypeToSong_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_PerfTypeToSong` ADD CONSTRAINT `_PerfTypeToSong_A_fkey` FOREIGN KEY (`A`) REFERENCES `perf_types`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_PerfTypeToSong` ADD CONSTRAINT `_PerfTypeToSong_B_fkey` FOREIGN KEY (`B`) REFERENCES `songs`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
