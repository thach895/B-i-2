DELIMITER //

CREATE PROCEDURE TransferBed(
    IN p_patient_id INT,
    IN p_new_bed_id INT
)
BEGIN

    -- Nếu có lỗi thì rollback
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Thao tác 1: Giải phóng giường cũ
    UPDATE Beds
    SET patient_id = NULL
    WHERE patient_id = p_patient_id;

    -- Giả lập lỗi hệ thống
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Lỗi: Máy chủ bị treo!';

    -- Thao tác 2: Gán giường mới
    UPDATE Beds
    SET patient_id = p_patient_id
    WHERE bed_id = p_new_bed_id;

    COMMIT;

END //

DELIMITER ;